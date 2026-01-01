export default function TermsPage() {
    return (
        <div className="container mx-auto px-4 py-20 max-w-4xl">
            <h1 className="text-3xl font-bold text-stone-800 mb-8 border-b border-stone-200 pb-4">
                利用規約
            </h1>

            <div className="space-y-8 text-stone-600 leading-relaxed">
                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第1条（はじめに）</h2>
                    <p>
                        この利用規約（以下「本規約」といいます）は、Kanei Quest（以下「当サービス」といいます）の利用条件を定めるものです。
                        登録ユーザーの皆様（以下「ユーザー」といいます）には、本規約に従って、本サービスをご利用いただきます。
                    </p>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第2条（利用登録）</h2>
                    <p>
                        登録希望者が当サービスの定める方法によって利用登録を申請し、当サービスがこれを承認することによって、利用登録が完了するものとします。
                        当サービスは、利用登録の申請者に以下の事由があると判断した場合、利用登録の申請を承認しないことがあり、その理由については一切の開示義務を負わないものとします。
                    </p>
                    <ul className="list-disc ml-6 mt-2 space-y-1">
                        <li>虚偽の事項を申請した場合</li>
                        <li>本規約に違反したことがある者からの申請である場合</li>
                        <li>その他、当サービスが利用登録を相当でないと判断した場合</li>
                    </ul>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第3条（ユーザーIDおよびパスワードの管理）</h2>
                    <p>
                        ユーザーは、自己の責任において、本サービスのユーザーIDおよびパスワードを適切に管理するものとします。
                        いかなる場合にも、ユーザーIDおよびパスワードを第三者に譲渡または貸与し、もしくは第三者と共用することはできません。
                    </p>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第4条（禁止事項）</h2>
                    <p>ユーザーは、本サービスの利用にあたり、以下の行為をしてはなりません。</p>
                    <ul className="list-disc ml-6 mt-2 space-y-1">
                        <li>法令または公序良俗に違反する行為</li>
                        <li>犯罪行為に関連する行為</li>
                        <li>本サービスの内容等、本サービスに含まれる著作権、商標権ほか知的財産権を侵害する行為</li>
                        <li>当サービス、ほかのユーザー、またはその他第三者のサーバーまたはネットワークの機能を破壊したり、妨害したりする行為</li>
                        <li>本サービスの運営を妨害するおそれのある行為</li>
                        <li>不正アクセスをし、またはこれを試みる行為</li>
                        <li>他のユーザーに成りすます行為</li>
                        <li>本サービスの他のユーザーに関する個人情報等を収集または蓄積する行為</li>
                        <li>不正な目的を持って本サービスを利用する行為</li>
                    </ul>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第5条（本サービスの提供の停止等）</h2>
                    <p>
                        当サービスは、以下のいずれかの事由があると判断した場合、ユーザーに事前に通知することなく本サービスの全部または一部の提供を停止または中断することができるものとします。
                    </p>
                    <ul className="list-disc ml-6 mt-2 space-y-1">
                        <li>本サービスにかかるコンピュータシステムの保守点検または更新を行う場合</li>
                        <li>地震、落雷、火災、停電または天災などの不可抗力により、本サービスの提供が困難となった場合</li>
                        <li>コンピュータまたは通信回線等が事故により停止した場合</li>
                        <li>その他、当サービスが本サービスの提供が困難と判断した場合</li>
                    </ul>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第6条（免責事項）</h2>
                    <p>
                        当サービスの債務不履行責任は、当サービスの故意または重過失によらない場合には免責されるものとします。
                        当サービスは、本サービスに関して、ユーザーと他のユーザーまたは第三者との間において生じた取引、連絡または紛争等について一切責任を負いません。
                    </p>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第7条（サービス内容の変更等）</h2>
                    <p>
                        当サービスは、ユーザーに通知することなく、本サービスの内容を変更しまたは本サービスの提供を中止することができるものとし、これによってユーザーに生じた損害について一切の責任を負いません。
                    </p>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第8条（利用規約の変更）</h2>
                    <p>
                        当サービスは、必要と判断した場合には、ユーザーに通知することなくいつでも本規約を変更することができるものとします。
                        なお、本規約の変更後、本サービスの利用を開始した場合には、当該ユーザーは変更後の規約に同意したものとみなします。
                    </p>
                </section>

                <section>
                    <h2 className="text-xl font-bold text-stone-800 mb-4">第9条（準拠法・裁判管轄）</h2>
                    <p>
                        本規約の解釈にあたっては、日本法を準拠法とします。
                        本サービスに関して紛争が生じた場合には、当サービス運営者の所在地を管轄する裁判所を専属的合意管轄とします。
                    </p>
                </section>
            </div>
        </div>
    );
}
