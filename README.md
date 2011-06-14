Reorder Children
===

About
---

Adds the ability to reorder the children of a certain page with drag and drop.
Tested on Radiant 1.0.0.rc2, but should work for older versions.

This extension is based on the work done by John Long in preparation for the feature to be a part
of Radiant 0.6.1. In the interest of making it available as soon as possible, it has been packaged
here for all the world to see.

"packaged here" was actually pointing to the old radiant subversion repository, so it was regenerated in a modern Radiant,
and cleaned up a bit.

Installation
---
  
    git clone git://github.com/jomz/radiant-reorder_children-extension.git vendor/extensions/reorder_children
    
or, add the gem to your environment.rb:

    config.gem "radiant-reorder_children-extension"

Then update and migrate:    

    rake db:migrate:extensions
    rake radiant:extensions:reorder:update

###Added Tags

Adds r:next and r:previous tags. These default to the previous and next sibling by position. 
Add a 'by' attribute to use i.e. the published_at column.

    <r:next [by="position|published_at|slug"]></r:next>

[rre]: https://github.com/radiant/radiant-reorder-extension
[jomz]: http://github.com/jomz
[radiant]: http://radiantcms.org/