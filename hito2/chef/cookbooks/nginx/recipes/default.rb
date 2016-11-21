execute 'apt-get update' do
  action :run
end

package 'nginx' do
  action :install
end

