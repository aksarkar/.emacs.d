(require 'elfeed)

(setq elfeed-feeds
      '(
        "http://33bits.org/feed/"
        "http://alltom.com/feed.atom"
        "http://apenwarr.ca/log/rss.php"
        "http://blog.computationalcomplexity.org/feeds/posts/default"
        "http://blog.cryptographyengineering.com/feeds/posts/default"
        "http://blog.regehr.org/feed"
        "http://carlos.bueno.org/atom.xml"
        "http://commandcenter.blogspot.com/feeds/posts/default"
        "http://compmeta.wordpress.com/feed/"
        "http://dabeaz.blogspot.com/feeds/posts/default"
        "http://donsbot.wordpress.com/feed/"
        "http://elliotth.blogspot.com/feeds/posts/default"
        "http://ericlippert.com/feed/"
        "http://evincarofautumn.blogspot.com/feeds/posts/default"
        "http://ewheel.democracynow.org/rss.xml"
        "http://existentialtype.wordpress.com/feed/"
        "http://feeds.feedburner.com/LettersOfNote"
        "http://feeds.feedburner.com/sportsblogs/tarheelblog.xml"
        "http://feeds.feedburner.com/vivekhaldar"
        "http://lambda-the-ultimate.org/rss.xml"
        "http://matt.might.net/articles/feed.rss"
        "http://neopythonic.blogspot.com/feeds/posts/default"
        "http://petr-mitrichev.blogspot.com/feeds/posts/default"
        "http://planet.emacsen.org/atom.xml"
        "http://prog21.dadgum.com/atom.xml"
        "http://rjlipton.wordpress.com/feed/"
        "http://themonadreader.wordpress.com/feed/"
        "http://www.archlinux.org/feeds/news/"
        "http://www.cs.uni.edu/~wallingf/blog/index.xml"
        "http://www.ethanzuckerman.com/blog/feed/"
        "http://www.megatokyo.com/rss/megatokyo.xml"
        "http://www.randomprogramming.com/feed/"
        "http://www.scottaaronson.com/blog/?feed=rss2"
        "https://al3x.net/atom.xml"
        "https://henrytcs.wordpress.com/feed/"
        "https://nplusonemag.com/feed/"
        "https://www.youtube.com/feeds/videos.xml?channel_id=UCHKMnH_CJ7hcZzpc0NY07WQ"
        )
      elfeed-search-clipboard-type 'CLIPBOARD
      elfeed-search-filter "+unread")

(provide 'aksarkar-elfeed)
