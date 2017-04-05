namespace :email_scheduler do
  desc "sends emails daily"
  task :daily => :environment do
    User.all.each do |user|
      NotificationMailer.sample_email(user).deliver_now
    end
  end
end
