// progressbar.js@1.0.0 version is used
// Docs: http://progressbarjs.readthedocs.org/en/1.0.0/
import ProgressBar from 'progressbar.js';

const initCircleBar = () => {
  const containers = document.querySelectorAll('.circle-bar-container');
  containers.forEach((container) => {

    const progress = Number.parseInt(container.firstElementChild.value) / 100;

    const bar = new ProgressBar.Circle(container, {
      strokeWidth: 14,
      easing: 'easeInOut',
      duration: 1400,
      color: '#72C1F9',
      trailColor: '#ECF7FF',
      trailWidth: 14,
      svgStyle: null
    });

    bar.animate(progress);  // Number from 0.0 to 1.0
  });

}

export { initCircleBar };
