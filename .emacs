;; Hello
;; my setting

(global-set-key "\M-?" `help-command)
(global-set-key "\C-h" `delete-backward-char)

;; recneter を真ん中じゃなくてちょい上にしようとしたけど無理だった;;
;;https://ayatakesi.github.io/emacs/26.1/html/Recentering.html


;; 日本語環境の設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8)

;; GNU/Linuxにおけるフォントの設定（IncosolataとIPA exGothic）
(set-frame-font "Inconsolata-14")
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPAExGothic"))



;; haskell-mode できた！！！
;; http://haskell.github.io/haskell-mode/manual/latest/Installation.html#Installation
;; このサイトの手順で上手くいった stack を四時間くらいかけてインストールした意味...
(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/")))))


;; Haskell mode (refer below, but not make it)
;; https://wiki.haskell.jp/Old/sampou.org/HowTo_ProgrammingEnviornment_Ubuntu8.04
;; 上の記事だと上手く行かなかったので削除した

;; https://haske11.hatenadiary.org/entry/20121210/1355134153
;; これで上手くいってる (追記:emacs25で上手くいってただけ？なんかできなくなった)
;;;;;;;;(require 'haskell-mode)
;; https://github.com/haskell/haskell-mode/issues/1406でエラーを解消
;;;;;;;(require 'haskell-mode-autoloads)

;;;;;;(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))


;; F5 で開いてるファイルの再読込

(defun revert-buffer-no-confirm (&optional force-reverting)
  "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
  (interactive "P")
  ;;(message "force-reverting value is %s" force-reverting)
  (if (or force-reverting (not (buffer-modified-p)))
      (revert-buffer :ignore-auto :noconfirm)
    (error "The buffer has been modified")))

  ;; reload buffer
  (global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)




;; スペース、タブなどを可視化する
;; (global-whitespace-mode 1)

;; 列数を表示する
(column-number-mode t)

;; 行数を表示する
(global-linum-mode t)

;; カーソルの点滅をやめる
(blink-cursor-mode 0)

;; カーソル行をハイライトする
(global-hl-line-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(put 'upcase-region 'disabled nil)

(add-to-list 'backup-directory-alist
	     (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

(cond(window-system
      (setq x-select-enable-clipboard t)
      ))

; for copy & paste emacs(terminal) with other
;(require 'xclip)
;(xclip-mode 1)
;

;;(setq auto-save-timeout 2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (xclip))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
