#!ruby
#coding: utf-8
module ApplicationHelper
  def menu_link_to( item )
    if current_page?( item[:link] )
      raw "<span class=¥'current_page¥'>" + item[:name] + "</ span>"
    elsif item[:disabled]
      raw "<span class=¥'disabled¥'>" + item[:name] + "(工事中)</span>"
    elsif item[:method]
      link_to(item[:name], item[:link], :method => item[:method]) 
    else
      link_to(item[:name], item[:link]) 
    end
  end
  
  def allow_to_admin_user_only
    if !current_user || current_user.role_id != 3
      redirect_to :user_root
      return true 
    end
    return false
  end

  def allow_to_shop_clerks_only
    if !current_user || current_user.role_id != 2
      redirect_to :user_root
      return true
    end
    return false
  end
  
  def security_code( code, mask="0110110001011101", rotate=5 )
    maskbit = mask.to_i(2)
    d = code ^ maskbit
    x = "1"*rotate # => "11111"
    d1 = d >> rotate
    x2 = "1"*rotate + "0"*(16-rotate)
    d2 = ((d << (16-rotate)) & x2.to_i(2)) 
    v = d1 | d2
    return v
  end
end
