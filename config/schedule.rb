# set :runner_command, "rails runner"
set :bundle_command, 'bundle exec'
job_type :runner,  "cd :path && :bundle_command rails runner -e :environment ':task' :output"