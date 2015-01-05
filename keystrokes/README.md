raw data format:

"time"    => time()
"request" => $_REQUEST
"server"  => $_SERVER
"id"      => $id

---------

./filter < raw.data > filtered.data

JSON list: [id, time, action, keycode]

action = up|pressed|down
id = f1|f2|f3|f4|f5

---------

convert filtered data to matlab file:

./parse.py out.mat < filtered.data

---------

load in Octave/MATLAB:

load out.mat

vectors: (f1|f2|f3|f4|f5)(up|pressed|down)

