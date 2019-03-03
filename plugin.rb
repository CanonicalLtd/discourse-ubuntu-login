# name: discourse-ubuntu-login
# about: Ubuntu SSO support for Discourse
# version: 1.0
# authors: Sam Saffron, Marco Ceppi, Gustavo Niemeyer

enabled_site_setting :ubuntu_login_enabled

auth_provider :title => 'with Ubuntu',
              :enabled_setting => 'ubuntu_login_enabled',
              :authenticator => Auth::OpenIdAuthenticator.new('ubuntu','https://login.ubuntu.com', :ubuntu_login_enabled, trusted: true),
              :message => 'Authenticating with Ubuntu (make sure pop up blockers are not enabled)',
              :frame_width => 1000,   # the frame size used for the pop up window, overrides default
              :frame_height => 800

register_css <<CSS

.btn-social.ubuntu {
  background: #772953;
}

.btn-social.ubuntu:before {
  font-family: Ubuntu;
  content: url(https://niemeyer.s3.amazonaws.com/discourse-ubuntu-login-icon.png);
}

CSS
