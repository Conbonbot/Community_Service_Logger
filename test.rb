text = "Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
@year = Array.new(12) {Array.new(2,0)}
yeah = 0
for i in 0..@year.count()-1
    @year[i][0] = text[yeah..yeah+3]
    yeah += 4
end
print @year
for i in 0..@year.count()-1
    @year[i][1] = i+1
end
print "\n"
print @year