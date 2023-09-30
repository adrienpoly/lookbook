import AceEditor from "ace-builds";

// import htmlWorkerUrl from "ace-builds/src-noconflict/worker-html?url";
// AceEditor.config.setModuleUrl("ace/mode/html_worker", htmlWorkerUrl);

// import jsWorkerUrl from "ace-builds/src-noconflict/worker-javascript?url";
// AceEditor.config.setModuleUrl("ace/mode/javascript_worker", jsWorkerUrl);

import "ace-builds/src-noconflict/worker-html";
import "ace-builds/src-noconflict/theme-tomorrow";
import "ace-builds/src-noconflict/mode-html";
import "ace-builds/src-noconflict/mode-javascript";
import "ace-builds/src-noconflict/mode-ruby";
import "ace-builds/src-noconflict/mode-html_ruby";

export default AceEditor;
