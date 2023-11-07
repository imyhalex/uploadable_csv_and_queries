-- Overall sales in by market
select category_name_new,product_name
	,count(order_item_quantity) as total_quantity
    ,avg(product_price) as per_product_price
    ,avg(benefit_per_order) as average_profit_per_order
from dataco_project.datacocleaned
where market = 'Africa'
group by 1,2
;

-- Class A product
product_name in (
    'perfect fitness perfect rip deck',
    "nike men's dri-fit victory golf polo",
    "nike men's free 5.0+ running shoe",
    "diamondback women's serene classic comfort bi",
    'field & stream sportsman 16 gun fire safe',
    'pelican sunstream 100 kayak'
)

-- Class B product
product_name in ("under armour girls' toddler spine surge runni",
       "nike men's cj elite 2 td football cleat", 'dell laptop',
       "o'brien men's neoprene life vest")

-- Class C product
product_name in (
    'smart watch', "under armour men's compression ev sl slide",
       "under armour women's micro g skulpt running s",
       "glove it women's mod oval 3-zip carry all gol",
       'bridgestone e6 straight distance nfl san dieg',
       "columbia men's pfg anchor tough t-shirt",
       'titleist pro v1x golf balls',
       'bridgestone e6 straight distance nfl tennesse',
       'polar ft4 heart rate monitor', 'eno atlas hammock straps',
       "adidas men's f10 messi trx fg soccer cleat",
       "brooks women's ghost 6 running shoe",
       'industrial consumer electronics', 'web camera',
       'sole e25 elliptical', 'elevation training mask 2.0',
       "adidas men's germany black crest away tee",
       'team golf pittsburgh steelers putter grip',
       'glove it urban brick golf towel',
       'team golf texas longhorns putter grip',
       "nike men's deutschland weltmeister winners bl",
       'team golf st. louis cardinals putter grip', 'summer dresses',
       'porcelain crafts', "men's gala suit",
       'team golf tennessee volunteers putter grip',
       'team golf san francisco giants putter grip',
       'glove it imperial golf towel', "nike men's comfort 2 slide",
       'under armour hustle storm medium duffle bag',
       "under armour kids' mercenary slide",
       "under armour women's ignite pip vi slide",
       "nike men's free tr 5.0 tb training shoe",
       'adidas youth germany black/red away match soc',
       "tyr boys' team digi jammer",
       "glove it women's imperial golf glove",
       'titleist pro v1x high numbers golf balls',
       'bridgestone e6 straight distance nfl carolina',
       "under armour women's ignite slide",
       'titleist pro v1x high numbers personalized go',
       'gopro hero3+ black edition camera', 'total gym 1400',
       "children's heaters", 'team golf new england patriots putter grip',
       "adidas kids' f5 messi fg soccer cleat",
       "nike women's tempo shorts",
       "glove it women's mod oval golf glove",
       'titleist pro v1 high numbers personalized gol',
       "under armour men's tech ii t-shirt", 'baby sweater',
       'mio alpha heart rate monitor/sport watch', 'sports books',
       "diamondback boys' insight 24 performance hybr",
       'polar loop activity tracker', 'garmin forerunner 910xt gps watch',
       'dvds', 'cds of rock',
       "nike kids' grade school kd vi basketball shoe",
       "nike women's free 5.0 tr fit prt 4 training s",
       "hirzl women's soffft flex golf glove",
       "the north face women's recon backpack", 'lawn mower',
       'nike dri-fit crew sock 6 pack',
       "nike women's legend v-neck t-shirt",
       'garmin approach s4 golf gps watch',
       'insta-bed neverflat air mattress',
       "nike men's kobe ix elite low basketball shoe",
       'adult dog supplies', 'first aid kit',
       'garmin approach s3 golf gps watch', 'rock music',
       'fighting video games',
       'fitbit the one wireless activity & sleep trac',
       'stiga master series st3100 competition indoor',
       "diamondback girls' clarity 24 hybrid bike 201",
       'adidas brazuca 2014 official match ball',
       'golfbuddy vt3 gps watch',
       'bushnell pro x7 jolt slope rangefinder',
       'yakima doubledown ace hitch mount 4-bike rack',
       "nike men's fingertrap max training shoe",
       'bowflex selecttech 1090 dumbbells', 'sole e35 elliptical',
       "hirzl women's hybrid golf glove", "hirzl men's hybrid golf glove",
       'taylormade 2014 purelite stand bag', 'bag boy beverage holder',
       'bag boy m330 push cart', 'clicgear 8.0 shoe brush',
       'titleist small wheeled travel cover', 'clicgear rovic cooler bag',
       'titleist club glove travel cover', 'ogio race golf shoes',
       "lija women's argyle golf polo",
       "lija women's eyelet sleeveless golf polo",
       "lija women's button golf dress",
       "lija women's mid-length panel golf shorts",
       "taylormade women's rbz sl rescue",
       "cleveland golf women's 588 rtx cb satin chrom",
       "top flite women's 2014 xl hybrid",
       'mdgolf pittsburgh penguins putter',
       'taylormade white smoke in-12 putter',
       'cleveland golf collegiate my custom wedge 588',
       "merrell men's all out flash trail running sho",
       "merrell women's grassbow sport waterproof hik",
       "merrell women's siren mid waterproof hiking b",
       "merrell women's grassbow sport hiking shoe", 'toys',
       'pelican maverick 100x kayak'
)

