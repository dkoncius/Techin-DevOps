# Excalidraw element reference (this repo)

Match `AI - Decomposition (hand).excalidraw` — do not invent extra top-level keys or omit required fields.

## Document shell

```json
{
  "type": "excalidraw",
  "version": 2,
  "source": "https://excalidraw.com",
  "elements": [],
  "appState": {
    "viewBackgroundColor": "#121212",
    "currentItemStrokeColor": "#d3d3d3",
    "currentItemBackgroundColor": "transparent",
    "currentItemFillStyle": "hachure",
    "currentItemRoughness": 1,
    "gridSize": null
  },
  "files": {}
}
```

## Shared shape fields (all elements)

`id`, `type`, `x`, `y`, `width`, `height`, `angle`, `strokeColor`, `backgroundColor`, `fillStyle`, `strokeWidth`, `strokeStyle`, `roughness`, `opacity`, `groupIds`, `frameId`, `roundness`, `seed`, `version`, `versionNonce`, `isDeleted`, `boundElements`, `updated`, `link`, `locked`

- `fillStyle`: `"hachure"` when `backgroundColor` is `transparent`; `"solid"` for filled shapes.
- `roundness`: `null` for text; `{"type":3}` rounded rect; `{"type":2}` ellipse / arrow.

## Text

Add: `fontSize`, `fontFamily` (1), `text`, `textAlign`, `verticalAlign`, `containerId`, `originalText`, `autoResize`, `lineHeight` (1.25).

Standalone title: `containerId` null, `textAlign` `"left"` or `"center"`.

## Rectangle / ellipse

`roundness` `{"type":3}` or `{"type":2}` for ellipse. Filled syllabus boxes often use `backgroundColor` `#154162`, `strokeColor` `#d3d3d3`, `strokeWidth` 2.

## Arrow

Same as line plus: `points`, `lastCommittedPoint`, `startBinding`, `endBinding`, `startArrowhead`, `endArrowhead` (`"arrow"` on end for directed edges).

## Line (grids only)

`type` `"line"`, `points` `[[0,0],[dx,dy]]`, no arrowheads. Used heavily in Gantt generators.

## IDs

16 hex chars (`uuid.uuid4().hex[:16]`). `version` 1, `versionNonce` any int (generator uses `seed` / `seed+1`).

## Python helper pattern

Copy from `ib-training/build_excalidraw.py` or `examples/ia-library-exemplar/diagrams/build_sketch_excalidraw.py` rather than duplicating field lists in chat output.
