# PDF Reader - Design Specifications

## Design Implementation Details

This Flutter app is built based on the Figma design: **PDF Reader — Sidebar open** (Node ID: 4-162)

### Screen Layout

```
┌─────────────────────────────────────────────────────┐
│  ☰ Event Tool phase 2...                    ⋯      │  ← Toolbar
├──────────────────────────────────────────────────────┤
│ ◀  Page 1 of 12  ▶                                    │
├─────────────┬───────────────────────────────────────┤
│   OUTLINE   │                                       │
│ ┌─────────┐ │                                       │
│ │Overview │ │                                       │
│ │Event... │ │     PDF VIEWER                       │
│ │Design..│ │                                       │
│ │Figma...│ │                                       │
│ └─────────┘ │                                       │
│             │                                       │
│ BOOKMARKS   │                                       │
│ ┌─────────┐ │                                       │
│ │Important│ │                                       │
│ │Key find.│ │                                       │
│ │Recommend│ │                                       │
│ └─────────┘ │                                       │
└─────────────┴───────────────────────────────────────┘
```

## Components

### 1. Toolbar (ReaderToolbar)
- **Location**: Top of screen
- **Height**: ~80px
- **Components**:
  - Sidebar toggle button (menu icon)
  - Document title (truncated if long)
  - Menu button (more_vert)
  - Navigation row with prev/next buttons
  - Page indicator (Page X of Y)

**Colors**:
- Background: White (#FFFFFF)
- Icon: Dark (#252B28)
- Text: Dark (#252B28)

### 2. Sidebar (PDFSidebar)
- **Width**: 280px
- **Structure**: 2 Fixed Sections
  - **Section 1: OUTLINE**
    - Overview
    - Event Planning Strategy
    - Design System
    - Figma Setup
  - **Section 2: BOOKMARKS**
    - Important Section
    - Key Findings
    - Recommendations

**Colors**:
- Background: White (#FFFFFF)
- Section header BG: Light gray (#F5F5F5)
- Section header text: Dark, uppercase, 12px
- Item text: Dark (#252B28)
- Selected item: Green (#528A78) with light background
- Border: Light gray (#E5E5E5)

### 3. PDF Viewer Area
- **Background**: Light gray (#F0F2F0)
- **PDF Container**: White background with subtle shadow
- **Content**: Real PDF file rendering using `pdfx` package

## Color Palette

| Color Name | Hex | RGB | Usage |
|---|---|---|---|
| Primary Green | #528A78 | (82, 138, 120) | Selected items, accents |
| Light Green BG | #E8EFEB | (232, 239, 235) | Button backgrounds |
| Dark Text | #252B28 | (37, 43, 40) | Primary text |
| Light BG | #F0F2F0 | (240, 242, 240) | Page background |
| White | #FFFFFF | (255, 255, 255) | Component backgrounds |
| Border Gray | #E5E5E5 | (229, 229, 229) | Dividers |
| Hover Gray | #F5F5F5 | (245, 245, 245) | Hover states |

## Typography

- **Headings**: 18px, Weight 600
- **Body**: 14px, Weight 400
- **Section Headers**: 12px, Weight 600, UPPERCASE
- **Page Info**: 13px, Weight 400

## Interactions

### Sidebar Toggle
- Click menu icon to toggle sidebar open/close
- Sidebar animates smoothly
- PDF viewer expands/contracts

### Page Navigation
- Click outline/bookmark items to navigate to page
- Page updates in toolbar
- PDF viewer updates to show selected page

### Navigation Controls
- Previous/Next buttons navigate between pages
- Buttons disabled at first/last page
- Page indicator updates

## PDF Configuration

**PDF File Path**:
```
/Users/kushdixit/Documents/Sample_App_PDF_Reader/PDF-Reader-Flutter/pdfs/
Event Tool phase 2_ Figma and flow Review – 2026_06_10 21_55 IST – Notes by Gemini.pdf
```

**Total Pages**: 12

## No Additional Elements

As per design requirements:
- ✅ No back button
- ✅ Minimal menu (search, zoom, settings only)
- ✅ Clean, focused UI
- ✅ Only 2 sidebar sections
- ✅ Direct PDF viewing area

## Responsive Behavior

- **On Desktop**: Full width sidebar visible, wide PDF area
- **On Tablet**: Sidebar can be toggled, flexible layout
- **On Mobile**: Sidebar toggles off by default, maximizes PDF area

## State Management

Currently using **StatefulWidget** for simplicity. For production:
- Consider **Provider** for page state
- Consider **Riverpod** for advanced features
- Implement **persistence** for last page viewed

## Performance

- PDF pages rendered on-demand (pdfx handles optimization)
- Sidebar remains stateful for smooth interactions
- Minimal rebuilds using focused setState calls
