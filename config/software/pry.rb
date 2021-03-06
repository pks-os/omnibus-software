#
# Copyright 2012-2017, Chef Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "pry"

license "MIT"
license_file "https://raw.githubusercontent.com/pry/pry/master/LICENSE"

skip_transitive_dependency_licensing true

dependency "ruby"
dependency "rubygems"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  gem_command = [ "install pry  --no-document" ]
  gem_command << "--version '#{version}'" unless version.nil?

  gem gem_command.join(" "), env: env

  gem "install pry-remote pry-byebug pry-stack_explorer  --no-document"
end
