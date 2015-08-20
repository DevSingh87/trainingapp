module BlogHelper
 def to_date(thisdate)
    thisdate.strftime("%B %e, %Y")
  end
end
