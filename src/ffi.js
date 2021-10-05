import React from 'react';
import ReactDOM from 'react-dom';

export const useState = React.useState
export const createElement = (tag, props = {}, ...args) => 
{
  if ('class_name' in props) {
    props.className = props.class_name[0];
    delete props.class_name;
  }
  if ('id' in props) {
    props.id = props.id[0];
  }
  if ('key' in props) {
    props.key = props.key[0]
  }
  return React.createElement(tag, props, ...args)
}

export const reactString = s => createElement(React.Fragment, undefined, [s])

export function render(componentTree, mountPoint) {
  ReactDOM.render(
    componentTree,
    document.getElementById(mountPoint)
  )
}

