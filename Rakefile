require 'cucumber'
require 'cucumber/rake/task'

desc 'Run Cucumber features and generate an HTML summary, JUnit XML and a plain text log'

Cucumber::Rake::Task.new(:features) do |t|
   t.cucumber_opts = [
      "--no-color",
      "--format progress -o logs/features.log",
      "--format junit    -o logs/",
      "--format html     -o logs/features.html",
      "--format pretty"
   ]
end



namespace :tests do
  desc "tests by cron"
  task :cron => ["tests:cron:cucumber", "tests:cron:send_mail"]

  namespace :cron do
    ENV['FORMATTER'] = 'mail'
    ENV['WAIT'] = 'true'

    task :send_mail do
        body = build_text_mail(
            ["cucumber_tests.txt"],
            ["Cucumber tests:"])

        res = prepare_chart(body)
        val = 100*(res[3].to_i)/(res[1].to_i)
        val_t = val < 99 ? val/2 : val
        r=(255*(100-val_t))/100
        g=(255*(val_t))/100;

        boxes = prepare_boxes(body)
        body = body.gsub!("\n", '<br />')

        mail2  = ""
        boxes.map do |b|
          mail2 = mail2 + "<div style='margin:5px;font-size:13px;color:white;float:right;background:darkred;text-decoration:line-through;'><div style='text-transform:uppercase;padding:5px;margin:2px;width:400px;border:1px solid silver;margin-left:5px;text-align:left;'>  #{b[0]}"
          b[1].map do |b1|
            mail2 = mail2 + "<div style='margin:4px;width:200px;border:0px solid silver;margin-left:5px;text-align:center;float:right;background:silver;color:black;text-transform:none;text-decoration:line-through;'> #{b1} </div> "
          end
          mail2 = mail2 + " <div style='font-size:1px;clear:both;'>&nbsp;</div> </div> </div>"
        end if boxes

        mail = "<html><body> <div style='width:800px;'>  #{mail2}  <div style='maring-top:0px;position:absolute;float:left;font-size:16px;color:darkblue;'><div style='width:300px;border:1px solid silver;margin-left:50px;text-align:center;'> #{res[0]} </div><div style='width:300px;height:250px;border:1px solid silver;margin-left:50px;text-align:center;background-color:rgb(#{r},#{g},0);'> <div style='font-size:44px;margin-top:80px;'> #{val}% </div> </div></div> </div> </div><div style='clear:both;'>&nbsp;</div><div style='font-size:1px;clear:both;'>&nbsp;</div><br /><br /><br /><br /><br /><hr>" + body + "</body></html>"

      send_notification(
        YAML.load_file(File.join(
          File.dirname(__FILE__),"tests_mail_users.yaml")),
        "test@test.com",
        "(UI) tests results, #{val}%,  #{Time.now}",
        mail.gsub("\n", '<br />'))
    end

    # we use line bellow instead of tests.sh
    # ruby -S bundle exec cucumber --out lib/tasks/cucumber_tests.txt --no-color features
    #
    Cucumber::Rake::Task.new(:cucumber) do |t|
      t.cucumber_opts = %Q(
        --out lib/tasks/cucumber_tests.txt
        --no-color
        features)
    end
  end
end

  # -- building text mail, include url, etc --

def build_text_mail(files, titles)
  data = ""
  files.each_with_index do |file, i|
    data += "\n\n#{titles[i]}\n\n"
    data += File.read(File.join(File.dirname(__FILE__), file))
  end
  # Add google file link with test coverage at the end of email
  data +="\n\n<a href='https://google.com'>Test Coverage</a>\n\n"
  # attached screenshots
  pictures = Dir.glob(Rails.root.join('public', 'images', 'screenshots', '*.png'))
  #pictures = Dir.glob(Rails.root.join("/var/www/office/public/images/capybara/*.png"))
  count = 0
  pictures.each do |p|
    count += 1
    data += "<img src='#{ 'https://google.com' + p.split('/').last }'>"
    break if count == 10
  end
  data
end

  # -- prepare chart for the table depeneding on statuses of tests run --

def prepare_chart(body)
  if res = /([0-9]*) scenarios \(([0-9]*) failed, ([0-9]*) passed\)/.match(body)
    res
  elsif res = /([0-9]*) scenarios \(([0-9]*) failed, ([0-9]*) undefined, ([0-9]*) passed\)/.match(body)
    [res[0], res[1], res[2], res[4]]
  elsif res =/([0-9]*) scenarios \(([0-9]*) passed\)/.match(body)
    [res[0], res[1], 0, res[2]]
  elsif res =/([0-9]*) scenarios \(([0-9]*) undefined, ([0-9]*) passed\)/.match(body)
    [res[0], res[1], 0, res[3]]
  elsif res =/([0-9]*) scenarios \(([0-9]*) pending, ([0-9]*) passed\)/.match(body)
    [res[0], res[1], 0, res[3]]
  elsif res =/([0-9]*) scenarios \(([0-9]*) failed, ([0-9]*) pending, ([0-9]*) passed\)/.match(body)
    [res[0], res[1], 0, res[4]]
  elsif res =/([0-9]*) scenarios \(([0-9]*) failed, ([0-9]*) undefined, ([0-9]*) pending, ([0-9]*) passed\)/.match(body)
    [res[0], res[1], 0, res[5]]
  elsif res =/([0-9]*) scenarios \(([0-9]*) failed, ([0-9]*) skipped, ([0-9]*) passed\)/.match(body)
    [res[0], res[1], 0, res[4]]
  else
    ['error', 1, 1, 0]
  end
rescue
  ['error', 1, 1, 0]
end

  # -- prepare boxes --

def prepare_boxes(body1)
  res = body1.scan /cucumber features\/(.*)\.feature/
  h = {}
  res.map do |m|
    g = m.first.split('/')
    if h["#{g[0]}"]
      h["#{g[0]}"] << g[1]
      h["#{g[0]}"] = h["#{g[0]}"].uniq
    else
      h["#{g[0]}"] = [g[1]]
    end
  end
  h
rescue
  nil
end
