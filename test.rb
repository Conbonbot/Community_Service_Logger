require 'roo'

xlsx = Roo::Spreadsheet.open('./Copy of Community Service 2015-2016.xlsx')
juniors = xlsx.sheet('Juniors 2021')
seniors= xlsx.sheet('SENIORS 2020')


seniors.each do |senior|
    id = senior[0]
    last_name = senior[1]
    first_name = senior[2]
    hours = senior[6]
    student = [id,last_name,first_name,hours]
    print(student)
    print("\n")
    system("sleep 2")
    print(User.first)
end