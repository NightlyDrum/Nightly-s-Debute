const slider = document.getElementById('speed-slider');
const output = document.getElementById('speed-output');

slider.addEventListener('input', function() {
    output.textContent = this.value;
});
