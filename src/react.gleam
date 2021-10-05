pub type Maybe(value) {
  Some(value)
  None
}

pub opaque type Element {
  Element(tag: String)
  ReactNode
}


pub opaque type Props {
  Props(key: Maybe(String), id: Maybe(String), class_name: Maybe(String))
}


// convenience types
pub type PropTypes {
  Id(id: String)
  Class(class: String) 
  Key(key: String)
}


pub external fn render(element: Element, mount_point: String) -> Nil =
  "./ffi.js" "render"

external fn create_element(tag: String, props: Props, children: List(Element)) -> Element =
  "./ffi.js" "createElement"

pub external fn use_state(initializer: t) -> #(t, fn(t) -> Nil) =
  "./ffi.js" "useState"

pub external fn react_string(string: String) -> Element =
  "./ffi.js" "reactString"

fn html_element(tag: String, props: Props, children: List(Element)) -> Element {
  create_element(tag, props, children)
}

pub fn div(props: List(PropTypes), children: List(Element)) {
  html_element("div", get_props(props), children)
}

pub fn button(props: List(PropTypes), children: List(Element)) {
  html_element("button", get_props(props), children)
}

pub fn get_props(props: List(PropTypes)) -> Props { 
  let [head, ..tail] = props
  let empty = Props(None, None, None)
  let rest = case tail {
      [] -> empty
      x -> get_props(tail)
    }
  case head {
    Id(id) -> {
      Props(..rest, id: Some(id))
      }
    Key(key) -> {
      Props(..rest, key: Some(key))
    }
    Class(class) ->  {
      Props(..rest, class_name: Some(class))
    }
    _ -> empty
  }
}
