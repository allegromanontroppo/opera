(function(){!function(){var n;return null!=(n=Array.prototype).shuffle?n.shuffle:n.shuffle=function(){var n,t,r,l,e;for(n=r=l=this.length-1;1>=l?1>=r:r>=1;n=1>=l?++r:--r)t=Math.floor(Math.random()*(n+1)),e=[this[t],this[n]],this[n]=e[0],this[t]=e[1];return this}}(),window.BillboardCtrl=function(n,t){return n.billboard=null,t.get("/data/billboards.json").success(function(t){return n.billboard=t.shuffle()[0]})},window.HeadlinersCtrl=function(n,t){return n.headliners=[],t.get("/data/headliners.json").success(function(t){return n.headliners=t.shuffle().slice(0,10).slice(0)})}}).call(this);