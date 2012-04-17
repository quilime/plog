<a onClick="return toggleView();" title="toggle view" href="#">
<canvas id="viewicon" width="25" height="25"></canvas>
</a>
<script>

    function toggleView() {
        console.log('toggle view');
        return false;
    }

    var mode = 'list';
    var canvas = document.getElementById('viewicon');
    drawIcon(mode);

    function drawIcon(mode) {
        if(canvas && canvas.getContext) {
            var ctx = canvas.getContext('2d');
            ctx.clearRect ( 0 , 0 , 25 , 25 );

            switch(mode) {
                case 'list' :
                    var lh = 4;
                    var blh = 1;
                    var toff = 4;
                    var w = 20;
                    ctx.beginPath();
                    for(var i = 0; i < 4; i++ ) {
                    ctx.moveTo(0, blh * i + lh * i + toff);
                    ctx.lineTo(w, blh * i + lh * i + toff);
                    }
                    ctx.closePath();
                    ctx.lineWidth = 3;
                break;
            }
            ctx.strokeStyle = "#2A80EB";
            ctx.stroke();
            ctx.fill();        
        }
    }
</script>
