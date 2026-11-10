(function(){
  var slides=[].slice.call(document.querySelectorAll('.slide')),cur=0,rendered={};
  var bar=document.querySelector('.bar'),counter=document.querySelector('.counter'),notes=document.querySelector('.notes');
  function steps(s){return [].slice.call(s.querySelectorAll('.reveal')).sort(function(a,b){return a.dataset.step-b.dataset.step})}
  function pending(s){return steps(s).filter(function(e){return !e.classList.contains('shown')})}
  function renderMermaid(s){
    if(rendered[s.dataset.i]||!window.mermaid)return;rendered[s.dataset.i]=1;
    var m=s.querySelectorAll('.mermaid');if(m.length){try{window.mermaid.run({nodes:m})}catch(e){}}
  }
  function show(i,all){
    cur=Math.max(0,Math.min(slides.length-1,i));
    slides.forEach(function(s,k){s.classList.toggle('active',k===cur)});
    var s=slides[cur];
    steps(s).forEach(function(e){e.classList.toggle('shown',!!all)});
    renderMermaid(s);
    bar.style.width=((cur+1)/slides.length*100)+'%';
    counter.textContent=(cur+1)+' / '+slides.length;
    notes.textContent=s.dataset.notes||'';
    try{history.replaceState(null,'','#'+(cur+1))}catch(e){}
  }
  function next(){var p=pending(slides[cur]);if(p.length){p.forEach(function(e,k){if(k===0||e.dataset.step===p[0].dataset.step)e.classList.add('shown')});}else show(cur+1)}
  function prev(){var sh=steps(slides[cur]).filter(function(e){return e.classList.contains('shown')});
    if(sh.length){var last=sh[sh.length-1].dataset.step;sh.forEach(function(e){if(e.dataset.step===last)e.classList.remove('shown')})}else if(cur>0)show(cur-1,true)}
  document.addEventListener('keydown',function(e){
    var k=e.key;
    if(k==='ArrowRight'||k===' '||k==='PageDown'||k==='Enter'){e.preventDefault();next()}
    else if(k==='ArrowLeft'||k==='PageUp'||k==='Backspace'){e.preventDefault();prev()}
    else if(k==='ArrowDown'){show(cur+1)}else if(k==='ArrowUp'){show(cur-1)}
    else if(k==='Home')show(0);else if(k==='End')show(slides.length-1);
    else if(k==='n'||k==='N')document.body.classList.toggle('show-notes');
    else if(k==='f'||k==='F'){if(document.fullscreenElement)document.exitFullscreen();else document.documentElement.requestFullscreen&&document.documentElement.requestFullscreen()}
  });
  if(window.mermaid){window.mermaid.initialize({startOnLoad:false,theme:'dark',securityLevel:'strict'})}
  var tx=null;document.addEventListener('touchstart',function(e){tx=e.touches[0].clientX},{passive:true});document.addEventListener('touchend',function(e){if(tx===null)return;var d=e.changedTouches[0].clientX-tx;tx=null;if(Math.abs(d)>60){d<0?next():prev()}},{passive:true});
  var start=parseInt((location.hash||'').slice(1),10)||1;
  show(start-1,/[?&]all\b/.test(location.search));
  window.addEventListener('load',function(){if(window.mermaid){window.mermaid.initialize({startOnLoad:false,theme:'dark'});rendered={};renderMermaid(slides[cur])}});
})();
