module TweetsHelper

  def media_urls(media_objects)
    media_objects.map { |media_object| { image: media_object.media_url.to_s } }
  end

  def favorite_button(tweet)
    button_to favorites_path(tweet: { number: tweet.id, text: tweet.full_text,
                                      user_name: tweet.user.name, user_screen_name: tweet.user.screen_name,
                                      user_url: tweet.user.url, user_profile_img: tweet.user.profile_image_url,
                                      tweet_images_attributes: media_urls(tweet.media)
                                      }), class:'btn btn-default btn-sm' do
      content_tag(:span, '', class: 'glyphicon glyphicon-star-empty',
                  'data-toggle':'tooltip', 'title':'Favorite')
    end
  end

  def unfavorite_button(tweet_number)
    button_to favorite_path(tweet_number), method: :delete, data: { confirm: "Unfavorite this Tweet?" },
                                       class:'btn btn-default btn-sm' do
      content_tag(:span, '', class:'glyphicon glyphicon-star',
                  'data-toggle':'tooltip', 'title':'Unfavorite')
    end
  end

  def full_size_image(image)
    image.to_s.gsub('_normal.', '.')
  end

  def full_size_banner(banner)
    banner.to_s[0..-4] + '1500x500'
  end

  def popover_information(user)
    div_content = "Tweets: #{user.tweets_count} - Followers: #{user.followers_count}"
    capture do
      concat content_tag(:div, user.description, class: 'popover_description')
      concat content_tag(:div, div_content)
    end
  end

end
