name 'circleci'
maintainer 'Matthew Ponzio'
maintainer_email 'mponzio@singlestoneconsulting.com'
license 'all_rights'
description 'Installs/Configures circleci'
long_description 'Installs/Configures circleci'
version '0.1.0'

depends 'aws', '~> 4.2.2'


# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/matthewponzio/circleci/issues' if respond_to?(:issues_url)

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/matthewponzio/circleci' if respond_to?(:source_url)
