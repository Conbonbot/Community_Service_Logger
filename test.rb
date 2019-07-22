require "time"
require "date"
def level(datetime)
    fr_cut = Time.parse("Jul 20 2019 00:00")
    so_cut = Time.parse("Jul 20 2020 00:00")
    ju_cut = Time.parse("Jul 20 2021 00:00")
    se_cut = Time.parse("Jul 20 2022 00:00")
    if datetime >= se_cut
        print "Senior\n"
    elsif datetime >= ju_cut
        print "Junior\n"
    elsif datetime >= so_cut
        print "Sophomore\n"
    elsif datetime >= fr_cut
        print "Freshman\n"
    else
        print "N/A\n"
    end
end
level(Time.parse("Dec 25 2019 00:00"))
level(Time.parse("Jan 20 2020 00:00"))
level(Time.parse("Sep 20 2020 00:00"))
level(Time.parse("Jan 05 2019 00:00"))
print("\n")
bruh = Time.new(2019, 7, 22, 9, 28, 0)
print(bruh)
print("\n")
bruh += 31622400 * 1 # increases by 1 year
print(bruh)
