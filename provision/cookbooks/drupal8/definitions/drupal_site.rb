define :drupal_site, :path => "/var/www", :version => "8.0.0", :database => "drupal8", :db_user => "drupal", :db_password => "m74U%92bV43!", :template => "site.conf.erb" do

  # Set up a variable that will hold the temp path for the latest drupal tar file.
  drupal_latest = Chef::Config[:file_cache_path] + '/drupal_latest.tar.gz'
  # Download the Drupal tarball.
  remote_file drupal_latest do
    source 'https://ftp.drupal.org/files/projects/drupal-' + params[:version] + '.tar.gz'
    mode 0644
  end

  # Create the directory which we'll run the D8 site from.
  directory params[:path] do
    owner 'root'
    group 'root'
    mode 0755
    action :create
    recursive true
  end

  # Untar the Drupal code into our web root
  execute "untar-drupal" do
    cwd params[:path]
    command 'tar --strip-components 1 -xzf ' + drupal_latest
  end

end