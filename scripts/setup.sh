# 通过rbenv 安装指定版本的ruby， ruby版本通过rbenv设置。 
# 例如：
# $ cd $(PROJECT_DIR)
# $ rbenv install 2.7.1
# $ rbenv local 2.7.1
ruby_version='cat .ruby-version'
if [[ ! -d "$HOME/.rbenv/versions/$ruby_version" ]]; then
	rbenv install $ruby_version;
fi

# 安装 bundler, 因为直接用gem的 pod install 安装cocoapods的话，偶尔会有问题，使用Bundler可以指定特定的gem版本.为ruby提供一致的环境。
gem install bundler
# 安装Gemfile文件中写的所有的gem
bundle install
# 安装 podfile文件中的pods库
bundle  exec pod install 