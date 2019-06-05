if exists('g:loaded_flutter')
  finish
else
  let g:loaded_flutter=1
endif

if !exists('g:flutter_command!')
  let g:flutter_command='flutter'
endif

if !exists('g:flutter_hot_reload_on_save')
  let g:flutter_hot_reload_on_save=1
endif

command! FlutterDevices call flutter#devices()
command! -nargs=* FlutterRun call flutter#run(<f-args>)
command! FlutterHotReload call flutter#hot_reload()
command! FlutterHotRestart call flutter#hot_restart()
command! FlutterQuit call flutter#quit()
command! FlutterVisualDebug call flutter#visual_debug()

if g:flutter_hot_reload_on_save
  autocmd FileType dart autocmd BufWritePost <buffer> call flutter#hot_reload_quiet()
endif

command! FlutterSplit :execute ':sbuffer ' . g:flutter_job
command! FlutterVSplit :execute ':vert sbuffer ' . g:flutter_job
command! FlutterTab :execute ':tab sbuffer ' . g:flutter_job

function! FlutterMenu() abort  
  menu Flutter.Run :FlutterRun<CR>
  menu Flutter.Hot\ Reload :FlutterHotReload<CR>
  menu Flutter.Hot\ Restart :FlutterHotRestart<CR>
  menu Flutter.Open\ Output.In\ &Split :FlutterSplit<CR>
  menu Flutter.Open\ Output.In\ &VSplit :FlutterVSplit<CR>
  menu Flutter.Open\ Output.In\ &Tab :FlutterTab<CR>
  menu Flutter.Quit :FlutterQuit<CR>
  menu Flutter.View\ Devices :FlutterDevices<CR>
endfunction
