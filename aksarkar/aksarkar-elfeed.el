(require 'elfeed)

(setq elfeed-feeds
      '(
        "http://33bits.org/feed/"
        "http://al3x.net/atom.xml"
        "http://alltom.com/feed.atom"
        "http://andrewgelman.com/feed/"
        "http://apenwarr.ca/log/rss.php"
        "http://blog.computationalcomplexity.org/feeds/posts/default"
        "http://blog.cryptographyengineering.com/feeds/posts/default"
        "http://carlos.bueno.org/atom.xml"
        "http://commandcenter.blogspot.com/feeds/posts/default"
        "http://connect.biorxiv.org/biorxiv_xml.php?subject=genetics+genomics"
        "http://dabeaz.blogspot.com/feeds/posts/default"
        "http://elliotth.blogspot.com/feeds/posts/default"
        "http://ericlippert.com/feed/"
        "http://evincarofautumn.blogspot.com/feeds/posts/default"
        "http://feeds.feedburner.com/LettersOfNote"
        "http://feeds.feedburner.com/vivekhaldar"
        "http://lambda-the-ultimate.org/rss.xml"
        "http://matt.might.net/articles/feed.rss"
        "http://neopythonic.blogspot.com/feeds/posts/default"
        "http://planet.emacsen.org/atom.xml"
        "http://prog21.dadgum.com/atom.xml"
        "http://www.archlinux.org/feeds/news/"
        "http://www.cs.uni.edu/~wallingf/blog/index.xml"
        "http://www.ethanzuckerman.com/blog/feed/"
        "http://www.megatokyo.com/rss/megatokyo.xml"
        "http://www.randomprogramming.com/feed/"
        "http://www.scottaaronson.com/blog/?feed=rss2"
        "https://compmeta.wordpress.com/feed/"
        "https://donsbot.wordpress.com/feed/"
        "https://errorstatistics.wordpress.com/feed/"
        "https://existentialtype.wordpress.com/feed/"
        "https://henrytcs.wordpress.com/feed/"
        "https://nplusonemag.com/feed/"
        "https://themonadreader.wordpress.com/feed/"
        "https://www.dissentmagazine.org/feed"
        )
      elfeed-search-clipboard-type 'CLIPBOARD
      elfeed-search-filter "+unread"
      url-queue-timeout 30)

(provide 'aksarkar-elfeed)
