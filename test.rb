require 'roo'

xlsx = Roo::Spreadsheet.open('./Copy of Community Service 2015-2016.xlsx')
seniors = xlsx.sheet('Seniors 2019')
juniors = xlsx.sheet('SENIORS 2020')


seniors.each do |senior|
    print(senior)
    print("\n")
    id = senior[0]
    last_name = senior[1]
    first_name = senior[2]
    hours = senior[4]
    student = [id,last_name,first_name,hours]
    #print(student)
    #print("\n")
end