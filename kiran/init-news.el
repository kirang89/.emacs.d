
;; rss feed reader
(global-set-key (kbd "C-c w") 'elfeed)

;;(setq-default elfeed-search-filter "-junk @1-week-ago +unread")

(setq elfeed-feeds
      '("http://feeds.feedburner.com/HighScalability"
	    "http://www.allthingsdistributed.com/atom.xml"
	   ;; "http://blog.cryptographyengineering.com/feeds/posts/default"
	    "http://prog21.dadgum.com/atom.xml"
	    "http://feeds.feedburner.com/codinghorror/"
	    "http://mechanical-sympathy.blogspot.com/feeds/posts/default"
	    "http://scale-out-blog.blogspot.com/feeds/posts/default"
	   ;; "http://queue.acm.org/rss/feeds/concurrency.xml"
	    "http://highlyscalable.wordpress.com/feed/"
	    "http://scalingsystems.com/feed/"
	    ;;"http://muratbuffalo.blogspot.com/feeds/posts/default"
	    ;;"http://feeds.feedburner.com/pbailis"
	    ;;"http://the-paper-trail.org/blog/feed/"
	    ;;"http://bad-concurrency.blogspot.com/feeds/posts/default"
	    ;;"http://martinfowler.com/bliki/bliki.atom"
	    "http://www.codesimplicity.com/feed/"
	    ;;"http://blog.bittorrent.com/category/engineering/feed/"
	    "http://serversforhackers.com/feed.xml"
	    "http://www.norvig.com/rss-feed.xml"
	    "http://lambda-the-ultimate.org/rss.xml"
	    ;;"http://www.johndcook.com/blog/feed/"
	    ;;"http://feeds.feedburner.com/tom-preston-werner"
	    ;;"http://feeds.feedburner.com/ScottHanselman"
	    ;;"http://www.guardian.co.uk/science/series/science/podcast.xml"
	    "http://feeds.feedburner.com/PyMOTW"
	    "http://techspot.zzzeek.org/feed/index.xml"
	    "https://alexgaynor.net/feeds/latest/"
        "http://eli.thegreenplace.net/feeds/all.atom.xml"
	    "http://lucumr.pocoo.org/feed.atom"
        "http://matt.might.net/articles/feed.rss"
	    ;;"http://www.joelonsoftware.com/rss.xml"
	    ;;"http://erratasec.blogspot.com/feeds/posts/default"
	    ;;"http://feeds.feedburner.com/nosql"
	    ;;"http://www.webperformancematters.com/journal/atom.xml"
	    ;;"http://www.theguardian.com/technology/rss"
	    ;;"http://youtube.com/rss/global/top_viewed_today.rss"
	    ;;"http://feeds.feedburner.com/ViralVideoChart",
	    ;;"http://apod.nasa.gov/apod.rss"
        "https://feeds.feedburner.com/zenhabits"
        "http://planet.emacsen.org/atom.xml"
        ("https://xkcd.com/atom.xml" xkcd)
        ))

(setf url-queue-timeout 30)

;; Entries older than 2 weeks are marked as read
(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "2 weeks ago"
                              :remove 'unread))

(provide 'init-news)
;;; init-news.el ends here
