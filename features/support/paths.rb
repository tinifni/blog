module NavigationHelpers
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the new navigation page/
      new_navigation_path

    when /the sign up page/i
      sign_up_path
    when /the sign in page/i
      sign_in_path
    when /the password reset request page/i
      new_password_path
    when /the new post page/i
      new_post_path
    when /the posts page/i
      '/posts'
    when /the post page for "(.*)"/i
      post = Post.first(:conditions => {:title => $1 } ) or raise "no such post #{$1}"
      post_path(post)

    # Add more page name => path mappings here

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
