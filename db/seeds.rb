User.create!(
             id: "1",
             first_name:  "Connor",
             last_name: "Harvey",
             email: "example@railstutorial.org",
             student_id: "123456",
             grade: "2021",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now
)

Supervisor.create!(  
    id: "1",
    first_name: "Prash",
    last_name: "Bhask",
    email: "prashanthbhaskara123@gmail.com",
    address: "1337 Example Ave.",
    telephone: "818-555-5555",
    organization: "example",
    role: "Head",
    activated: true,
    activated_at: Time.zone.now,
    created_at: Time.zone.now,
    password: "foobar",
    password_confirmation: "foobar",
    access_code: "4231988210"
    )
    
users = User.order(:created_at).take(1)
40.times do
    hour = SecureRandom.random_number(100)
    users.each { |user| user.hours.create!(content: hour, approved: true, supervisor: Supervisor.find_by(id: 1), supervisor_id: 1, email: "example@joey.com", created_at: Time.zone.now, updated_at: Time.zone.now) }
end

