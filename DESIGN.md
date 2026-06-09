---
name: Ethereal Garden
colors:
  surface: '#faf9f5'
  surface-dim: '#dadad6'
  surface-bright: '#faf9f5'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#f4f4ef'
  surface-container: '#efeeea'
  surface-container-high: '#e9e8e4'
  surface-container-highest: '#e3e3de'
  on-surface: '#1a1c1a'
  on-surface-variant: '#45483f'
  inverse-surface: '#2f312e'
  inverse-on-surface: '#f1f1ed'
  outline: '#75786e'
  outline-variant: '#c5c8bc'
  surface-tint: '#556345'
  primary: '#556345'
  on-primary: '#ffffff'
  primary-container: '#b8c7a3'
  on-primary-container: '#465337'
  inverse-primary: '#bdcca8'
  secondary: '#7c5357'
  on-secondary: '#ffffff'
  secondary-container: '#fdc7cb'
  on-secondary-container: '#795154'
  tertiary: '#635979'
  on-tertiary: '#ffffff'
  tertiary-container: '#c9bce1'
  on-tertiary-container: '#544a69'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d9e8c2'
  primary-fixed-dim: '#bdcca8'
  on-primary-fixed: '#141f07'
  on-primary-fixed-variant: '#3e4b2f'
  secondary-fixed: '#ffdadc'
  secondary-fixed-dim: '#eeb9bd'
  on-secondary-fixed: '#301216'
  on-secondary-fixed-variant: '#623c40'
  tertiary-fixed: '#eaddff'
  tertiary-fixed-dim: '#cdc1e5'
  on-tertiary-fixed: '#1f1732'
  on-tertiary-fixed-variant: '#4b4260'
  background: '#faf9f5'
  on-background: '#1a1c1a'
  surface-variant: '#e3e3de'
typography:
  headline-lg:
    fontFamily: Playfair Display
    fontSize: 48px
    fontWeight: '600'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Playfair Display
    fontSize: 32px
    fontWeight: '600'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Playfair Display
    fontSize: 32px
    fontWeight: '500'
    lineHeight: '1.2'
  headline-sm:
    fontFamily: Playfair Display
    fontSize: 24px
    fontWeight: '500'
    lineHeight: '1.3'
  body-lg:
    fontFamily: DM Sans
    fontSize: 18px
    fontWeight: '400'
    lineHeight: '1.6'
  body-md:
    fontFamily: DM Sans
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-md:
    fontFamily: DM Sans
    fontSize: 14px
    fontWeight: '500'
    lineHeight: '1.4'
    letterSpacing: 0.05em
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  container-max: 1200px
  gutter: 24px
  margin-desktop: 64px
  margin-mobile: 20px
  section-gap: 80px
---

## Brand & Style

This design system is built on the principles of **Modern Elegance** and **Ethereal Minimalism**. It draws inspiration from romantic garden weddings, emphasizing a sense of airiness, soft transitions, and delicate composition. The target audience is discerning couples seeking a digital experience that feels as tactile and cherished as a physical invitation.

The visual style utilizes a high degree of whitespace and subtle translucency. It avoids heavy borders and harsh shadows in favor of light-drenched surfaces and refined editorial typography. The overall mood is optimistic, timeless, and sophisticated.

## Colors

The palette is derived from the natural, soft hues of a spring garden.

- **Primary (Sage Green):** Used for key brand moments, primary actions, and success states. It represents the lush greenery of the wedding backdrop.
- **Secondary (Blush Pink):** Used for romantic accents, hover states, and decorative elements.
- **Tertiary (Dusty Lavender):** Used for secondary highlights and categorized information.
- **Neutral (Slate Charcoal):** A soft, warm charcoal used for all body text and headings to ensure high readability against pastel backgrounds without the harshness of pure black.
- **Backgrounds:** The primary background is a Warm White (`#FDFCFB`), with tinted variations of the pastel palette used for subtle section differentiation.

## Typography

The typography strategy pairs a high-contrast serif for emotional impact with a clean, geometric sans-serif for functional clarity.

**Playfair Display** is the primary display face, used for names, titles, and emotional headers. Its classic proportions evoke traditional calligraphy and high-end publishing.

**DM Sans** provides a modern, low-contrast balance. It is used for all functional text, including body copy, form labels, and button text, ensuring the interface remains accessible and easy to navigate across all devices.

## Layout & Spacing

The layout utilizes a **Fixed Grid** system on desktop to maintain the "invitation-like" centered composition, transitioning to a fluid model on mobile devices.

- **Desktop (1440px+):** 12-column grid with 24px gutters and 64px outer margins.
- **Tablet (768px - 1024px):** 8-column grid with 20px gutters and 40px outer margins.
- **Mobile (below 768px):** 4-column fluid grid with 16px gutters and 20px outer margins.

Spacing is generous to promote a feeling of calm. Section gaps are intentionally large to allow high-quality photography and typography to breathe.

## Elevation & Depth

This design system avoids traditional drop shadows. Depth is communicated through **Tonal Layering** and **Glassmorphism**:

1.  **Surfaces:** Cards and containers use a subtle semi-transparent white background (`rgba(255, 255, 255, 0.7)`) with a high-intensity backdrop blur (20px).
2.  **Overlays:** Modal backdrops use a very soft tint of the primary Sage Green (`#B8C7A3`) at 10% opacity.
3.  **Outlines:** Elements are defined by thin, low-contrast 1px borders in a darker tint of the background color rather than shadows.

## Shapes

The shape language is **Soft and Organic**. 

We use a 0.25rem (4px) base radius for buttons and input fields to maintain a sense of formal structure, while decorative cards and image containers utilize `rounded-lg` (8px) or `rounded-xl` (12px) to feel more inviting. Large UI containers like modals or main content sections should favor the softer `rounded-xl` setting.

## Components

### Buttons
- **Primary:** Solid Sage Green background with white text. No shadow.
- **Secondary:** Transparent background with a thin 1px Blush Pink border and Blush Pink text.
- **Tertiary:** Text-only with a subtle underline that expands on hover.

### Input Fields
Inputs use a minimal "underline" style or a very light background fill. The focus state is a soft transition to the primary Sage Green border.

### Cards
Cards are the primary container for wedding details (registry, RSVP, etc.). They should use the glassmorphic style with a soft backdrop blur and no shadow, creating the effect of a translucent vellum paper.

### Chips & Tags
Used for guest categories or meal choices. These are styled with a soft background tint of the secondary or tertiary colors and matched text color for a monochromatic look.

### Navigation
A centered, minimal navigation bar with high letter-spacing on labels. On scroll, the bar gains a glassmorphic background to maintain legibility over page content.