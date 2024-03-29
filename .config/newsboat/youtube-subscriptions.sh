#! /bin/bash

# Delete all previous YouTube feeds
# including the query feed
sed -i '/youtube.com\/feeds/d' ~/.config/newsboat/urls
sed -i '/query:YouTube:tags/d' ~/.config/newsboat/urls

# Import the new feed
newsboat -i $1

# Create a query feed to combine the youtube feeds
echo '"query:YouTube:tags # \"youtube\""' >> ~/.config/newsboat/urls

# Hide the individual feeds and tag them under "youtube"
sed -i -e 's/"YouTube Subscriptions"/"!" "youtube"/g' ~/.config/newsboat/urls
