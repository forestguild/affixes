require 'yaml'
require 'date'
require 'chronic'

module Jekyll
    module Commands
        class Affixes < Command
            class << self
                @@data = YAML.load_file(File.dirname(__FILE__) + '/../data.yml')

                def init_with_program(prog)
                    prog.command(:wowaffixes) do |c|
                        c.syntax "wowaffixes [options]"
                        c.option "region", "--region REGION", "Region code, eg: eu"
                        c.description "Calculate mythic+ wow affixes"
                        c.action do |args, options|
                            config = Jekyll.configuration({})
                            week = getCurrentWeek()
                            delay = getDelay(options['region'] || 'eu')
                            affixes = {}
                            affixes['current'] = getAffixes(week, delay)
                            affixes['next'] = getAffixes(week+1, delay)
                            affixes['previous'] = getAffixes(week-1, delay)

                            File.write(File.expand_path(config['data_dir']) + '/affixes_' + (options['region'] || 'eu') + '.json', affixes.to_json)
                        end
                    end
                end

                def getDelay(region='eu')
                    (region.downcase == 'eu' ? 1 : 0).to_i
                end

                def getCurrentWeek()
                    initWeek = @@data['init'] #First week when mythic+ epoch started
                    weekOffset = 0
                    nowString = Time.now
                    now = nowString.to_i
                    startWeek = ((Chronic.parse("this Tuesday", :now => nowString).to_date - 6).to_time + (9 * 60 * 60)).to_i #M+ week start (eg: 2018-11-21 09:00:00)
                    endWeek = (Chronic.parse("this Tuesday", :now => nowString).to_time + 20 * 60 * 60 + 59 * 60 + 59).to_i #M+ week end (eg: 2018-11-28 08:59:59)
                    unless (now >= startWeek && now <= endWeek)
                        weekOffset -= 1
                    end
                    initWeek = Time.at(initWeek).to_datetime
                    thisWeek = Time.at(startWeek).to_datetime

                    (((thisWeek - initWeek).to_i / 7 + weekOffset).floor).to_i
                end

                def getAffixes(week, delay)
                    # Get Week number with world delay
                    week = week + delay
                    # Get whole m+ affixes size
                    cycleSize = @@data['cycle'].length
                    # Calculate current turn
                    turn = week % cycleSize

                    @@data['cycle'][turn]
                end
            end
        end
    end
end
