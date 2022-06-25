
library(tidyverse)
library(paletteer)
library(showtext)
library(janitor)

font_add_google('Lato','Lato')
showtext_auto()

# https://pubmed.ncbi.nlm.nih.gov/21477680/

birth_ctrl = tribble(
  ~'Method', ~'unintend_preg_%_inFirstYr_typicalUse',
  'no method', 85,
  'spermicides',28,
  'withdrawal',22,
  'sponge_parous_nulliparous',24+12,
  'condom_penis',18,
  'condom_vagina',21,
  'diaphragm', 12,
  'pill&progestin',9,
  'Evra patch',9,
  'Depo-Provera',6,
  'IUD_ParaGard',0.8,
  'IUD_Mirena',0.2,
  'sterilization_female',0.5,
  'sterilization_male',0.15
  
)


birth_ctrl %>% 
  select(method = Method,
         unintended_preg = `unintend_preg_%_inFirstYr_typicalUse`) %>% 
  mutate(method = factor(method)) %>% 
  ggplot(
    aes(x= unintended_preg,
        y= fct_reorder(method,unintended_preg),
        fill= unintended_preg
        )
  )+
  geom_col()+
  ggdark::dark_mode()+
  scale_fill_paletteer_c(`"gameofthrones::margaery"`)+
  labs(
    title = "\nContraceptive failure in US (2011)",
    subtitle = "1st year of unintended pregnancies",
    y="Birth Control method",
    x="unintended pregnancies (%)",
    caption = "\n@R_LGBTQ | June 24, 2022 | Data: (NIH PubMed) Contraception: 2011 May:83(5)\n",
    fill="pregnancies %"
  )+
  theme(
    text = element_text(family = 'Lato'),
    axis.title.y = element_text(size = 13),
    axis.text.y = element_text(size = 12, color = 'white'),
    axis.text.x = element_text(size = 12),
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5),
    plot.caption = element_text(hjust = 0, size = 11)
  )




