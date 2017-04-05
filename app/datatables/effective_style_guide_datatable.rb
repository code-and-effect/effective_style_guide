if defined?(EffectiveDatatables) && Gem::Version.new(EffectiveDatatables::VERSION) >= Gem::Version.new('3.0')
  class EffectiveStyleGuideDatatable < Effective::Datatable

    datatable do
      col :id
      col :material, search: { collection: ['Stainless Steel', 'Copper', 'Cast Iron', 'Composite'] }
      col :bowl, search: { collection: ['Single Bowl', 'Double Bowl', 'Triple Bowl'] }
      col :name

      actions_col show: false, edit: false, destroy: false do
        [link_to('View', '#'), link_to('Edit', '#')].join('&nbsp;-&nbsp;').html_safe
      end
    end

    collection do
      [
        [1, 'Stainless Steel', 'Single Bowl', 'KOHLER Staccato'],
        [2, 'Stainless Steel', 'Double Bowl', 'KOHLER Vault Undercounter'],
        [3, 'Stainless Steel', 'Triple Bowl', 'KRAUS All-In-One'],
        [4, 'Stainless Steel', 'Single Bowl', 'KOHLER Vault Dual Mount'],
        [5, 'Stainless Steel', 'Single Bowl', 'KRAUS All-In-One Undermount'],
        [6, 'Stainless Steel', 'Double Bowl', 'Glacier Bay All-in-One'],
        [7, 'Stainless Steel', 'Single Bowl', 'Elkay Neptune'],
        [8, 'Copper', 'Single Bowl', 'ECOSINKS Apron Front Dual Mount'],
        [9, 'Copper', 'Double Bowl', 'ECOSINKS Dual Mount Front Hammered'],
        [10, 'Copper', 'Triple Bowl', 'Glarier Bay Undermount'],
        [11, 'Copper', 'Single Bowl', 'Whitehaus Undermount'],
        [12, 'Copper', 'Double Bowl', 'Belle Foret Apron Front'],
        [13, 'Copper', 'Double Bowl', 'Pegasus Dual Mount'],
        [14, 'Cast Iron', 'Double Bowl', 'KOHLER Whitehaven'],
        [15, 'Cast Iron', 'Triple Bowl', 'KOHLER Hartland'],
        [16, 'Cast Iron', 'Single Bowl', 'KOHLER Cape Dory Undercounter'],
        [17, 'Cast Iron', 'Double Bowl', 'KOLER Bakersfield'],
        [18, 'Cast Iron', 'Double Bowl', 'American Standard Offset'],
        [19, 'Cast Iron', 'Single Bowl', 'Brookfield Top'],
        [20, 'Composite', 'Single Bowl', 'Blanco Diamond Undermount'],
        [21, 'Composite', 'Double Bowl', 'Mont Blanc Waterbrook'],
        [22, 'Composite', 'Triple Bowl', 'Pegasus Triple Mount'],
        [23, 'Composite', 'Single Bowl', 'Swanstone Dual Mount']
      ]
    end

  end
end

