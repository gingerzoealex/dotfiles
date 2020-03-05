on_reith () {
 [ "BBC On Network" = "$(/usr/sbin/scselect 2>&1 | grep '^ \*' | sed 's/.*(\(.*\))/\1/')" ]
}
if on_reith;
	then
	 echo "On Reith"
	 export http_proxy="http://www-cache.reith.bbc.co.uk:80"
	 export https_proxy="$http_proxy"
	 export HTTP_PROXY="$http_proxy"
	 export HTTPS_PROXY="$http_proxy"
	 export ALL_PROXY="$http_proxy"
	 export no_proxy=localhost,127.0.0.1
	 export NO_PROXY=$no_proxy
	 ln -fs ~/.ssh/on-reith-config ~/.ssh/config
	 if [[ -n $(which npm) ]]; then
		 npm config set proxy $http_proxy
		 npm config set https-proxy $https_proxy
	 fi
	 if [[ -n $(which git) ]]; then
		 git config --global http.proxy $http_proxy
		 git config --global https.proxy $http_proxy
	 fi
	else
	 echo "Off Reith"
	 unset http_proxy
	 unset https_proxy
	 unset HTTP_PROXY
	 unset HTTPS_PROXY
	 unset ALL_PROXY
	 unset no_proxy
	 unset NO_PROXY
	 ln -fs ~/.ssh/off-reith-config ~/.ssh/config
	 if [[ -n $(which npm) ]]; then
		 npm config rm proxy
		 npm config rm https-proxy
	 fi
	 if [[ -n $(which git) ]]; then
		 git config --global --unset http.proxy
		 git config --global --unset https.proxy
	 fi
	 echo HTTP_PROXY
fi
export NVM_DIR="$HOME/.nvm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
