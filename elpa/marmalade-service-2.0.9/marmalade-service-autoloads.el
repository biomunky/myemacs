;;; marmalade-service-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (marmalade-init) "marmalade-boot" "marmalade-boot.el"
;;;;;;  (21244 62769 0 0))
;;; Generated autoloads from marmalade-boot.el

(autoload 'marmalade-init "marmalade-boot" "\
Start the marmalade service.

\(fn)" nil nil)

(eval-after-load 'marmalade-boot (if (and (boundp 'marmalade-boot-onload) marmalade-boot-onload (or (not (boundp 'marmalade/inited)) (not marmalade/inited))) (progn (marmalade-init) (setq marmalade/inited nil))))

;;;***

;;;### (autoloads nil nil ("marmalade-archive.el" "marmalade-service-pkg.el"
;;;;;;  "marmalade-service.el") (21244 62769 306466 0))

;;;***

(provide 'marmalade-service-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; marmalade-service-autoloads.el ends here
