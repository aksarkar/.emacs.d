(require 'elfeed)

(setq elfeed-feeds
      '(
        "http://apenwarr.ca/log/rss.php"
        "http://blog.computationalcomplexity.org/feeds/posts/default"
        "http://blog.cryptographyengineering.com/feeds/posts/default"
        "http://blog.samaltman.com/posts.atom"
        "http://blog.shakirm.com/feed/"
        "http://carlos.bueno.org/atom.xml"
        "http://commandcenter.blogspot.com/feeds/posts/default"
        "http://dabeaz.blogspot.com/feeds/posts/default"
        "http://elliotth.blogspot.com/feeds/posts/default"
        "http://ericlippert.com/feed/"
        "http://evincarofautumn.blogspot.com/feeds/posts/default"
        "http://feeds.feedburner.com/MeltingAsphalt"
        "http://jmrphy.net/feed.xml"
        "http://jvns.ca/atom.xml"
        "http://lambda-the-ultimate.org/rss.xml"
        "http://matt.might.net/articles/feed.rss"
        "http://michaelnielsen.org/blog/feed/"
        "http://neopythonic.blogspot.com/feeds/posts/default"
        "http://paulgraham.com/rss.html"
        "http://pressthink.org/feed/"
        "http://prog21.dadgum.com/atom.xml"
        "http://slatestarcodex.com/feed/"
        "http://unremediatedgender.space/feeds/all.atom.xml"
        "http://wavefunction.fieldofscience.com/feeds/posts/default"
        "http://www.archlinux.org/feeds/news/"
        "http://www.ashokkarra.com/feed/"
        "http://www.cs.uni.edu/~wallingf/blog/index.xml"
        "http://www.ethanzuckerman.com/blog/feed/"
        "http://www.inference.vc/rss/"
        "http://www.megatokyo.com/rss/megatokyo.xml"
        "http://www.nxn.se/valent?format=RSS"
        "http://www.randomprogramming.com/feed/"
        "http://zmagg.tumblr.com/rss"
        "https://astralcodexten.substack.com/feed"
        "https://balioc.wordpress.com/feed/"
        "https://bbs.archlinux.org/extern.php?action=feed&tid=250765&type=atom"
        "https://blog.acolyer.org/feed/"
        "https://blog.aurynn.com/feed.rss"
        "https://blog.jaibot.com/feed/"
        "https://compmeta.wordpress.com/feed/"
        "https://danwang.co/?feed=rss"
        "https://donsbot.wordpress.com/feed/"
        "https://everythingstudies.com/feed/"
        "https://geneticvariance.wordpress.com/feed/"
        "https://juliagalef.com/feed/"
        "https://knowingless.com/feed/"
        "https://particularvirtue.blogspot.com/feeds/posts/default"
        "https://pseudoerasmus.com/feed/"
        "https://putanumonit.com/feed/"
        "https://radimentary.wordpress.com/feed/"
        "https://rss.art19.com/closer-than-they-appear"
        "https://samreuben.wordpress.com/feed/"
        "https://samzdat.com/feed/"
        "https://slatestarcodex.com/feed/"
        "https://srconstantin.wordpress.com/feed/"
        "https://status451.com/feed/"
        "https://swellandcut.com/feed/"
        "https://themonadreader.wordpress.com/feed/"
        "https://theotherlifenow.com/feed"
        "https://theunitofcaring.tumblr.com/rss"
        "https://thezvi.wordpress.com/feed/"
        "https://thingsthatchangethewayithink.blogspot.com/feeds/posts/default"
        "https://unstableontology.com/feed/"
        "https://write.as/harold-lee/feed/"
        "https://www.adamjuliangoldstein.com/feed.xml"
        "https://www.alexirpan.com/feed.xml"
        "https://www.epsilontheory.com/feed/"
        "https://www.pine64.org/feed/"
        "https://www.quinnnorton.com/said/?feed=rss2"
        "https://www.robrhinehart.com/rss/"
        "https://www.scottaaronson.com/blog/?feed=rss2"
        "https://www.sonyasupposedly.com/rss/"
        )
      elfeed-search-clipboard-type 'CLIPBOARD
      elfeed-search-filter "+unread"
      url-queue-timeout 30)

(provide 'aksarkar-elfeed)
