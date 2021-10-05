import react.{Id, Class, Key, use_state, render, div, button, react_string}

pub fn my_component() {
  div(
    [Class("outer")],
    [
      div([Key("1")], [react_string("Hello there")]),
    ]
  )
}

pub fn main() {
  render(my_component(), "root")
}
