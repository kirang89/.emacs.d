;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("ae" "self.assertEqual($1, $2)" "assertEqual" nil nil nil nil "direct-keybinding" nil)
		       ("ane" "self.assertNotEqual($1, $2)" "assertNotEqual" nil nil nil nil "direct-keybinding" nil)
		       ("class" "\n\nclass Template():\n    \"\"\"This is a template\"\"\"\n    def __init__(self):\n        pass\n\n    def __repr__(self):\n        return \"<>\"\n" "class" nil nil nil nil "direct-keybinding" nil)
		       ("pyb" "#!/usr/bin/env python\n# -*- coding: utf-8 -*-\n" "pybootstrap" nil nil nil nil "direct-keybinding" nil)
		       ("script" "#!/usr/bin/env python\n\ndef main():\n    pass\n\nif __name__ == '__main__':\n    main()" "script" nil nil nil nil "direct-keybinding" nil)))


;;; Do not edit! File generated at Thu Nov 13 02:00:26 2014
