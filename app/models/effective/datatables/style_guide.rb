if defined?(EffectiveDatatables) && Gem::Version.new(EffectiveDatatables::VERSION) < Gem::Version.new('3.0')
  module Effective
    module Datatables
      class StyleGuide < Effective::Datatable
        any_version = Proc.new do
          array_column :id, :width => '10%'
          array_column :material, :filter => {:type => :select, :values => ['Stainless Steel', 'Copper', 'Cast Iron', 'Composite']}
          array_column :bowl, :filter => {:type => :select, :values => ['Single Bowl', 'Double Bowl', 'Triple Bowl']}
          array_column :name
          array_column :actions, :filter => false, :sortable => false do
            [link_to('View', '#'), link_to('Edit', '#')].join('&nbsp;-&nbsp;').html_safe
          end
        end

        require 'effective_datatables/version'
        if Gem::Version.new(EffectiveDatatables::VERSION) >= Gem::Version.new('2.0')
          datatable do
            instance_eval &any_version
          end
        else
          instance_eval &any_version
        end

        def collection
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
  end
end
