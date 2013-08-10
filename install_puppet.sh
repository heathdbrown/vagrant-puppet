#!/bin/bash
#License
#The use and distribution terms for this software are covered by the Eclipse Public License 1.0 (http://opensource.org/licenses/eclipse-1.0.php) which can be found in the file epl-v10.html at the root of this distribution. By using this software in any fashion, you are agreeing to be bound by the terms of this license. You must not remove this notice, or any other, from this software.
#Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
# used from https://github.com/niclasmeier/puppet-ec2-enc
set -e -x
export DEBIAN_FRONTEND=noninteractive

echo "Adding Puppetlabs repository..."
curl -o /tmp/puppetlabs-release-precise.deb http://apt.puppetlabs.com/puppetlabs-release-precise.deb
dpkg -i /tmp/puppetlabs-release-precise.deb

echo "Updating APT repositories..."
apt-get update && apt-get upgrade -y

echo "Installing puppet and facter..."
sudo apt-get install puppet facter -y

echo "Wrinting puppet conf..."
(cat <<"END"
[main]
logdir=/var/log/puppet
vardir=/var/lib/puppet
ssldir=/var/lib/puppet/ssl
rundir=/var/run/puppet
factpath=$vardir/lib/facter
templatedir=$confdir/templates
server=puppetmaster.example.com
END
) > /etc/puppet/puppet.conf

echo "Enabling autostart for Puppet..."
cat /etc/default/puppet | sed s/START=no/START=yes/g > /etc/default/puppet.tmp && mv /etc/default/puppet.tmp /etc/default/puppet

echo "Stating Puppet ..."
service puppet start
