class EmpresasCapacitacionesResponse < ApplicationRecord
    has_one :evaluation, as: :evaluatable
end
