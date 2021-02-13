module LoginModule
  def login(user)
    visit "/login"
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
  
  def log_in_as(user)
    get login_path
    post login_path, params: {
        email: user.email,
        password: user.password
    }
  end
  
  def log_in_as(user2)
    get login_path
    post login_path, params: {
        email: user2.email,
        password: user2.password
    }
  end
  
  def log_in_as(user3)
    get login_path
    post login_path, params: {
        email: user3.email,
        password: user3.password
    }
  end
end