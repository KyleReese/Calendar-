namespace :email_scheduler do
  desc "sends emails daily"
  task :daily => :environment do
    User.all.each do |user|
      puts user.email
      NotificationMailer.sample_email(user).deliver_now
    end
  end
end
