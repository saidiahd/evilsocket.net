# -*- coding: utf-8 -*-
<div id="leftwrap">
  <div class="navwidth">
      <ul class="navigation">
        <li
        %if page != UNDEFINED and page.title == 'index':
          class="current_page_item"  
        %else:
          class="page_item page-item"
        %endif    
        >  
          <h2><a href='${config.siteurl}/index.${config.page_ext}'>Home</a></h2>
        </li>
        %for cat in categories:
          %if category != UNDEFINED and category.title == cat.title:
            <li class="current_page_item"><h2><a href="${config.siteurl}${cat.url}" title="Visualizza tutti gli articoli archiviati in ${cat.title | h}">${cat.title | h}</a></h2></li> 
          %else:
            <li class="page_item page-item"><h2><a href="${config.siteurl}${cat.url}" title="Visualizza tutti gli articoli archiviati in ${cat.title | h}">${cat.title | h}</a></h2></li> 
          %endif
        %endfor

        <li
        %if author != UNDEFINED and author.username == 'evilsocket':
          class="current_page_item"  
        %else:
          class="page_item page-item"
        %endif    
        >  
          <h2><a href='${config.siteurl}/members/evilsocket.${config.page_ext}'>About Me</a></h2>
        </li>
      </ul>
  </div> <!-- navwidth -->

  <div id="sidebar">
    <div id="searchdiv">
      <form method="get" id="searchform" action="${config.siteurl}" >
        <input type="text" value="Search" name="s" id="searchinput" onblur="if (this.value == '') {this.value = '';}"  onfocus="if (this.value == 'Search') {this.value = '';}"/>
      </form>
    </div> <!-- searchdiv -->
    <br/>

    <h2>GPG Public Key</h2>  
    <ul>
			  <li> 
        <a href="${config.siteurl}/public-key.txt" target="_blank">
          <img src="${config.siteurl}/images/lock.png" style="border:0px;" alt="My GPG Public Key" />
        </a>
        </li>
    </ul>

    <h2>Translation</h2>
      <ul>
        <li> 
            <a target="_blank" rel="nofollow" onclick="return translateTo('en');" title="Translate to English">
              <img style="cursor: pointer;" alt="Translate to English" src="${config.siteurl}/images/flags/us.png" title="Translate to English" border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('de');" title="Translate to German">
              <img style="cursor: pointer;" alt="Translate to German" src="${config.siteurl}/images/flags/de.png" title="Translate to German" border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('es');" title="Translate to Spanish ">
              <img style="cursor: pointer;" alt="Translate to Spanish " src="${config.siteurl}/images/flags/es.png" title="Translate to Spanish " border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('fr');" title="Translate to French ">
              <img style="cursor: pointer;" alt="Translate to French " src="${config.siteurl}/images/flags/fr.png" title="Translate to French " border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('ja');" title="Translate to Japanese BETA">
              <img style="cursor: pointer;" alt="Translate to Japanese BETA" src="${config.siteurl}/images/flags/jp.png" title="Translate to Japanese BETA" border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('ko');" title="Translate to Korean BETA">
              <img style="cursor: pointer;" alt="Translate to Korean BETA" src="${config.siteurl}/images/flags/kr.png" title="Translate to Korean BETA" border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('ru');" title="Translate to Russian BETA ">
              <img style="cursor: pointer;" alt="Translate to Russian BETA " src="${config.siteurl}/images/flags/ru.png" title="Translate to Russian BETA " border="0" />
            </a>
            <a target="_blank" rel="nofollow" onclick="return translateTo('zh-CN');" title="Translate to Chinese BETA">
              <img style="cursor: pointer;" alt="Translate to Chinese BETA" src="${config.siteurl}/images/flags/cn.png" title="Translate to Chinese BETA" border="0" />
            </a>
         </li>
    </ul>

   
    <h2>Articoli Recenti</h2>		
    <ul>
      %for p in pages[0:10]:
        <li><a href="${config.siteurl}${p.url}" title="${p.title | h}">${p.title | h}</a></li>
      %endfor
    </ul>

    <h2>Tags</h2>  
    <ul>
      <li style='text-align: justify;'> 
        <%
          import math
          import random

          total       = 50
          minOccurs   = len( tags[total].items )
          maxOccurs   = len( tags[0].items )
          minFontSize = 12;
          maxFontSize = 30;
          randomized  = tags[0:total]
          random.shuffle(randomized)
        %>
        % for tag in randomized:
          <%
            current = len( tag.items )
            weight  = ( math.log(current) - math.log(minOccurs) ) / ( math.log(maxOccurs) - math.log(minOccurs) );
            size    = minFontSize + round( ( maxFontSize - minFontSize ) * weight );
          %>
          <a href="${config.siteurl}${tag.url}" title="${len(tag.items)} argomenti" style="font-size: ${size}px">${tag.title | h}</a>         
        % endfor
        </li>
    </ul>

    <h2>Social Links</h2>
    <ul>
      <li><a href="http://github.com/evilsocket" rel="me">Github <img src="${config.siteurl}/images/github.png" alt="Github" title="Github" /></a></li>
      <li><a href="http://stackoverflow.com/users/300881/simone-margaritellii" rel="me">StackOverflow <img src="${config.siteurl}/images/stackoverflow.png" alt="StackOverflow" title="StackOverflow" /></a></li>
      <li><a href="http://identi.ca/evilsocket" rel="me">Identi.ca <img src="${config.siteurl}/images/identica.png" alt="Identi.ca" title="Identi.ca" /></a></li>
      <li><a href="http://twitter.com/evilsocket" rel="me">Twitter <img src="${config.siteurl}/images/twitter.png" alt="Twitter" title="Twitter" /></a></li>
      <li><a href="http://www.last.fm/user/evilsocket" rel="me">Last.fm <img src="${config.siteurl}/images/lastfm.png" alt="Last.fm" title="Last.fm" /></a></li>
      <li><a href="http://it.linkedin.com/in/simonemargaritelli" rel="me">LinkedIn <img src="${config.siteurl}/images/linkedin.png" alt="LinkedIn" title="LinkedIn" /></a></li>
      <li><a href="http://www.google.com/reader/shared/07374427796734922326" rel="me">Google Reader <img src="${config.siteurl}/images/googlereader.png" alt="Google Reader" title="Google Reader" /></a></li>
    </ul>

    <h2>My Tweets</h2>
    <ul>
      <li>
      <script type="text/javascript" src="http://widgets.twimg.com/j/2/widget.js"></script> 
      <script type="text/javascript"> 
      new TWTR.Widget({
        version: 2,
        type: 'profile',
        rpp: 5,
        interval: 6000,
        width: 'auto',
        height: 350,
        theme: {
          shell: {
            background: 'transparent',
            color: '#3E4449'
          },
          tweets: {
            background: 'transparent',
            color: '#AAA',
            links: '#FFFFFF'
          }
        },
        features: {
          scrollbar: false,
          loop: false,
          live: true,
          hashtags: true,
          timestamp: true,
          avatars: false,
          behavior: 'all'
        }
      }).render().setUser('evilsocket').start();
      </script>
      </li>
    </ul>

    <h2>Siti Amici</h2>
    <ul>
      <li><a href="http://www.backbox.org/" title="BackBox Linux Security Distro" target="_blank">BackBox Linux</a></li>
      <li><a href="http://blacklight.gotdns.org/" target="_blank">BlackLight</a></li>
      <li><a href="http://www.clshack.it/">ClsHack</a></li>
      <li><a href="http://www.tuxmealux.net/" target="_blank">Matrix86</a></li>
      <li><a href="http://meh.doesntexist.org/" target="_blank">Meh</a></li>
      <li><a href="http://retrogod.altervista.org/" target="_blank">rgod</a></li>
      <li><a href="http://ultimoprofetawebblog.wordpress.com/" target="_blank">UltimoProfeta</a></li>
      <li><a href="http://www.oversecurity.net/" target="_blank">Over Security</a></li>
      <li><a href="http://kn0t.doesntexist.org/" target="_blank">Kn0t - DUNNO</a></li>
    </ul>

  </div> <!-- sidebar -->
</div> <!-- leftwrap -->
