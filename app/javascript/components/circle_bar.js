// progressbar.js@1.0.0 version is used
// Docs: http://progressbarjs.readthedocs.org/en/1.0.0/
import ProgressBar from 'progressbar.js';

const initCircleBar = () => {
  const container = document.querySelector('.circle-bar-container');
  const bar = new ProgressBar.Circle(container, {
    strokeWidth: 8,
    easing: 'easeInOut',
    duration: 1400,
    color: '#72C1F9',
    trailColor: '#645988',
    trailWidth: 8,
    svgStyle: null
  });

  bar.animate(0.7);  // Number from 0.0 to 1.0
}

export { initCircleBar };
