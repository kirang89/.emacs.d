
;; rss feed reader
(global-set-key (kbd "C-c w") 'elfeed)

;;(setq-default elfeed-search-filter "-junk @1-week-ago +unread")

(setq elfeed-feeds
      '(("http://feeds.feedburner.com/HighScalability" scalability)
	    "http://www.allthingsdistributed.com/atom.xml"
	    ;; "http://blog.cryptographyengineering.com/feeds/posts/default"
	    "http://prog21.dadgum.com/atom.xml"
	    "http://feeds.feedburner.com/codinghorror/"
	    "http://mechanical-sympathy.blogspot.com/feeds/posts/default"
	    "http://scale-out-blog.blogspot.com/feeds/posts/default"
	    ;; "http://queue.acm.org/rss/feeds/concurrency.xml"
	    ;; "http://highlyscalable.wordpress.com/feed/"
        "https://feeds.feedburner.com/wordpress/dfRp"
	    ("http://scalingsystems.com/feed/" scalability)
	    ;;"http://muratbuffalo.blogspot.com/feeds/posts/default"
	    ;;"http://feeds.feedburner.com/pbailis"
	    ;;"http://the-paper-trail.org/blog/feed/"
	    ;;"http://bad-concurrency.blogspot.com/feeds/posts/default"
	    ;;"http://martinfowler.com/bliki/bliki.atom"
	    "http://www.codesimplicity.com/feed/"
	    ;;"http://blog.bittorrent.com/category/engineering/feed/"
	    "http://serversforhackers.com/feed.xml"
	    ("http://www.norvig.com/rss-feed.xml" python)
	    "http://lambda-the-ultimate.org/rss.xml"
	    ;;"http://feeds.feedburner.com/tom-preston-werner"
	    ;;"http://feeds.feedburner.com/ScottHanselman"
	    "http://feeds.feedburner.com/PyMOTW"
	    ("http://techspot.zzzeek.org/feed/index.xml" python)
	    ;;"https://alexgaynor.net/feeds/latest/"
        ("http://eli.thegreenplace.net/feeds/all.atom.xml" python)
        ("https://feeds.feedburner.com/ArminRonachersThoughtsAndWritings" python)
        "http://matt.might.net/articles/feed.rss"
	    ;;"http://www.joelonsoftware.com/rss.xml"
	    ;;"http://erratasec.blogspot.com/feeds/posts/default"
	    ;;"http://feeds.feedburner.com/nosql"
	    ;;"http://www.webperformancematters.com/journal/atom.xml"
	    ;;"http://apod.nasa.gov/apod.rss"
        "https://feeds.feedburner.com/zenhabits"
        ("http://planet.emacsen.org/atom.xml" emacs)
        ("https://xkcd.com/atom.xml" comic)
        ("http://kracekumar.com/rss" python)
        ("http://emacsrocks.com/atom.xml" emacs)
        ("http://whattheemacsd.com/atom.xml" emacs)
        ("http://planetpython.org/rss20.xml" python)
        ("http://emacsninja.com/feed.atom" emacs)
        ("https://feeds.feedburner.com/GustavoDuarte")
        ("https://feeds.feedburner.com/oatmealfeed" comic)
        ("http://www.commitstrip.com/en/feed/" comic)
        ("http://feeds.feedburner.com/space/Nugs" space)
        ("https://feeds.feedburner.com/SendMoreParamedics" clojure)
        ("http://gigasquidsoftware.com/atom.xml" clojure)
        ("http://feeds.feedburner.com/scaleyourcode/MkrS" scalability)
        ("http://feeds.feedburner.com/curiosity/zISN" science)
        ))

(setf url-queue-timeout 45)

;; Entries older than 2 weeks are marked as read
;; (add-hook 'elfeed-new-entry-hook
;;           (elfeed-make-tagger :before "2 weeks ago"
;;                               :remove 'unread))

(provide 'init-news)
;;; init-news.el ends here
